import subprocess
import json

subprocess.call("/usr/local/bin/aws devicefarm list-runs --arn arn:aws:devicefarm:us-west-2:602688267222:project:82c85e2e-8300-45ec-8943-143647d26ed7 > project_runs.json", shell=True)

with open("project_runs.json", "r") as f:
    output = f.read()
    list_project_arn = json.loads(output)["runs"]
    for project in list_project_arn:
        # subprocess.call("/usr/local/bin/aws devicefarm stop-run --arn {}".format(project["arn"]), shell=True)
        subprocess.call("/usr/local/bin/aws devicefarm delete-run --arn {}".format(project["arn"]), shell=True)
