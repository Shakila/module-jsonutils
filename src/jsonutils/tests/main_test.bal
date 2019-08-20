// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import ballerina/io;

json schema = {
    "$schema": "http://json-schema.org/draft-04/schema#",
    "title": "Person",
    "description": "A person",
    "type": "object",
    "properties":
    {
        "name":
        {
            "description": "A person's name",
            "type": "string"
        },
        "age":
        {
            "description": "A person's age",
            "type": "number",
            "minimum": 18,
            "maximum": 60
        }
    },
    "required": ["name", "age"]
};

# Test function

@test:Config{}
function testJSONValidation () {
    io:println("-----------------Test case for validateJSON method------------------");

    json jval = {
        "name": "John Doe",
        "age": 35
    };

    boolean validationRes = validateJSON(jval, schema);
    test:assertTrue(validationRes, msg = "Not a valid JSON!");
}

@test:Config{}
function testJSONValidationNegative () {
    io:println("-----------------Negative test case for validateJSON method------------------");

    json jval = {
        "name": "John Doe",
        "age": 70
    };

    boolean validationRes = validateJSON(jval, schema);
    test:assertFalse(validationRes);
}
