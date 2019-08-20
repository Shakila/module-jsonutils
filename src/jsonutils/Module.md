# Module Overview

The `wso2/jsonutils` module provides an API to do JSON validation.

## Compatibility

|                             |       Version               |
|:---------------------------:|:---------------------------:|
| Ballerina Language          | 0.992.0                     |

## Sample

Following is a simple Ballerina program for validating the *JSON* object.

```ballerina
import ballerina/log;
import wso2/jsonutils;

public function main () {
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

    json jval = {
        "name": "John Doe",
        "age": 35
    };

    boolean validationRes = jsonutils:validateJSON(jval, schema);
    log:printInfo("Result of the JSON validation is: " + validationRes);
}
```
