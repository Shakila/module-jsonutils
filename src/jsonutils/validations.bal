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

import ballerina/io;
import ballerinax/java;

# Check whether the JSON object is valid with the provided JSON schema.
#
# + jsonObject - The JSON object to validate
# + jsonSchema - The JSON schema to validate
# + return - Boolean flag indicating whether the JSON object is valid with the provided JSON schema.
public function validateJSON(json jsonObject, json jsonSchema) returns boolean {
    return isValidJSON(jsonObject.toString(), jsonSchema.toString());
}

function isValidJSON(string jsonObject, string jsonSchema) returns boolean = @java:Method {
    name: "isValidJSON",
    class: "org.wso2.ei.module.jsonutils.JSONValidations"
} external;
