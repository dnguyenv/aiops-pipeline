# Build an AI/ML pipe line for your AIOps initiatives
Scripts and code to provision AI and ML pipeline on OpenShift 4.x using Open Data Hub frame work

`script` folder contains scripts to install the open data hub operator. These environment variables need to be set before running the commands:

```bash
export OCP_ADMIN_USER=<your ocp admin user name>
export OCP_ADMIN_PASS=<your ocp admin password>
export OCP_API_ENDPOINT=<your ocp api url>, eg: https://api.dunguyen-aiopstest.dev07.red-chesterfield.com:6443
```

Before running the installation script, make changes to `scripts/deploy/crds/aiops_odh_cr.yaml` accordingly to to enable/disable pipeline components as needed

```bash
$ git clone https://github.com/dnguyenv/aiops-pipeline.git
$ cd aiops-pipeline/scripts
$ ./aiops-pipelone-provision.sh
```

