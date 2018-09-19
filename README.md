# helm
This step vendors the helm executable, and allows the user to execute a
command. Most options are passed along to the `helm` executable as is.

# Options:

      token:                    parameters for KUBECONFIG
      username:                 parameters for KUBECONFIG
      password:                 parameters for KUBECONFIG
      server:                   parameters for KUBECONFIG
      certificate-authority:    parameters for KUBECONFIG
      client-certificate:       parameters for KUBECONFIG
      client-key:               parameters for KUBECONFIG
      insecure-skip-tls-verify: parameters for KUBECONFIG
      cluster-name:             Name of the Kubernetes Cluster that you wish to deploy your Helm Chart to 
      context-name:             If there is a specific context you wish to set for the cluster
      client-only:              <boolean> # optional, default: "true"
      release-name:             Name of the release you wish to have, will be auto generated if left empty 
      release-namespace:        If you do not specify this, the default namespace is used
      repo:                     Path to the Helm Repo
      chart-name:               Name of the Chart that you wish to deploy in the Helm Repo
      values-file:              Path to Values file that you wish to override default chart settings
      
The options mentioned above available as wercker properties. 
The values are passed directly to the `helm` command. 

## What are the internals of this step
 * It has an Oracle Linux Container installed with Kubectl and Helm 
 * Other installed packages are gettext for dynamic env variable replacement for the Kubeconfig file
 * The structure of the kubeconfig file is created in config file available in this repo 
 * The structure has value riders that are defined by the options specified in the step 
 * The run.sh file simply has the logic to get the options specified in the step and parse them along with the command wherever necessary 

