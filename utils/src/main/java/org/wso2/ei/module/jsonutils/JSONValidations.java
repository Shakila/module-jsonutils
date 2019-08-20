/*
 * Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.wso2.ei.module.jsonutils;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.fge.jackson.JsonLoader;
import com.github.fge.jsonschema.core.exceptions.ProcessingException;
import com.github.fge.jsonschema.core.report.ProcessingReport;
import com.github.fge.jsonschema.main.JsonSchema;
import com.github.fge.jsonschema.main.JsonSchemaFactory;
import org.ballerinalang.util.exceptions.BallerinaException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.IOException;

public class JSONValidations {
    private static final Logger log = LoggerFactory.getLogger(JSONValidations.class);

    private JSONValidations() {}

    public static boolean isValidJSON(String json, String schema) {
        JsonNode jsonSchemaNode;
        JsonNode jsonPayload;
        JsonSchema jsonSchema;
        ProcessingReport report;
        final JsonSchemaFactory factory = JsonSchemaFactory.byDefault();

        try {
            jsonSchemaNode = JsonLoader.fromString(schema);
            jsonPayload = JsonLoader.fromString(json);
            jsonSchema = factory.getJsonSchema(jsonSchemaNode);
        } catch (IOException | ProcessingException e) {
            throw new BallerinaException("Error while validating the JSON Schema : " + e.getMessage());
        }
        try {
            report = jsonSchema.validate(jsonPayload);
            return report.isSuccess();
        } catch (ProcessingException e) {
            log.info("Error while validating the JSON Schema " + e.getMessage());
            return false;
        }
    }
}
