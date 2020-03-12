#!/bin/bash
# oc delete -f deploy/crds -f deploy --recursive

# Prep steps

# source ./local.rc

oc login -u $OCP_ADMIN_USER -p $OCP_ADMIN_PASS --server $OCP_API_ENDPOINT

oc apply -f deploy/storage/scc.yaml
oc apply -f deploy/storage/operator.yaml

# Check the initiation status

oc get pods -n rook-ceph-system

oc apply -f deploy/storage/cluster.yaml
oc apply -f deploy/storage/toolbox.yaml
oc apply -f deploy/storage/object.yaml

oc apply -f deploy/storage/object-user.yaml

#oc get secrets -n rook-ceph rook-ceph-object-user-my-store-odh-user -o json

oc get svc -n rook-ceph

oc expose service rook-ceph-rgw-my-store -l name=my-route --name=spiritedengineering -n rook-ceph

oc new-project demo

oc get secret -n rook-ceph rook-ceph-object-user-my-store-odh-user --export -o yaml | oc apply -n demo -f-

oc apply -f deploy/crds/aiops_odh_crd.yaml -n demo

# apply RBAC policy 

oc apply -f deploy/service_account.yaml
oc apply -f deploy/role.yaml
oc apply -f deploy/role_binding.yaml
oc adm policy add-role-to-user admin -z opendatahub-operator

# Deploy operator
oc apply -f deploy/operator.yaml

# apply an instance 
oc apply -f deploy/crds/aiops_odh_cr.yaml

# oc get pods
