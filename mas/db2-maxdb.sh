oc new-project maxdb
oc create sa maxdb-sa
oc adm policy add-scc-to-user anyuid -z maxdb-sa
oc adm policy add-scc-to-user privileged -z maxdb-sa
oc create -f mas/db2-maxdb.yaml
