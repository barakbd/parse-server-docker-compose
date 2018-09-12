# https://medium.com/@auscunningham/debug-your-openshift-node-js-apps-locally-with-visual-studio-code-vs-code-1b7da847fd9c

node inspect dist/server.js # starts inspect-brk on 9229
oc project your-project-name
oc set probe dc box --liveness --readiness --remove=true
oc port-forward $(oc get pod | grep box | grep Running | awk '{print $1}' 9229:9229

########## REMOTE DEBUG ###############
# Get process id by port or name - Linux
netstat -vanp tcp | grep 3050
# Get Process ID by name on Mac
lsof -nP -i4TCP:3050 | grep node

# https://codefresh.io/docker-tutorial/debug_node_in_docker/
# Node v8+ - use inspector (not debugger with SIGUSR1)
node inspect -p $(pidof -s node)
docker exec <container_id> node -e 'process._debugProcess(<node_pid>)'
node -e 'process._debugProcess(<node_pid>)'
#Verify debugger started
# https://unix.stackexchange.com/questions/106561/finding-the-pid-of-the-process-using-a-specific-port
netstat -nlp|grep 9229



