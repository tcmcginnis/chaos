#/bin/bash
#
# Copy container images to worker nodes
# so we don't need to pull them on the fly
#
DEFAULT="krkn-hub_node-scenarios-NEW.tgz"
FILES="${*:-$DEFAULT}"
for FILE in $FILES
do
   echo "Copying file: $FILE"
   ansible ocp411workers -u core -m copy -a "src=$FILE dest=."
done

ansible ocp411workers -u core -m shell -a 'ls *.tgz|xargs -l1 sudo podman load -i'

ansible ocp411workers -u core -m shell -a 'rm *.tgz'

# ansible ocp411workers -u core -m shell -a 'sudo podman images|grep -v dev'

