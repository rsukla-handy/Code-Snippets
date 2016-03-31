#!/usr/bin/env bash

variable=$(aws devicefarm get-upload --arn $test_arn | jsawk -a 'return this' | python -c "import json,sys;obj=json.load(sys.stdin); print obj['upload']['status']")

# JSON object return from `aws devicefarm get-upload --arn $test_arn`

{
    "upload": {
        "status": "SUCCEEDED",
        "name": "IMDb_5.4.1.105410410_105410410.apk",
        "created": 1442719884.445,
        "type": "ANDROID_APP",
        "arn": "arn:aws:devicefarm:us-west-2:705582597265:upload:2c21a412-bb7b-4657-a28c-d7d78b3888f7/d1f8bebc-a7f5-49a3-881f-f1ffdae90303",
        "metadata": "{\"screens\": [\"small\", \"normal\", \"large\", \"xlarge\"], \"sdk_version\": \"14\", \"package_name\": \"com.imdb.mobile\", \"native_code\": [], \"target_sdk_version\": \"18\", \"version_name\": \"5.4.1.105410410\", \"version_code\": \"105410410\", \"activity_name\": \"com.imdb.mobile.HomeActivity\"}"
    }
}
