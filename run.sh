#!/bin/sh

helm="$WERCKER_STEP_ROOT/helm-kubectl"

main() {
  display_version


  if [ -z "$WERCKER_HELM_COMMAND" ]; then
    fail "wercker-helm: command argument cannot be empty"
  fi
  
  helm_cmd="$WERCKER_HELM_COMMAND"
 

  #global_args
  global_args=
  raw_global_args="$WERCKER_KUBECTL_RAW_GLOBAL_ARGS"

  # token
  if [ -n "$WERCKER_KUBECTL_TOKEN" ]; then
    global_args="$global_args --token=\"$WERCKER_KUBECTL_TOKEN\""
  fi

  # username
  if [ -n "$WERCKER_KUBECTL_USERNAME" ]; then
    global_args="$global_args --username=\"$WERCKER_KUBECTL_USERNAME\""
  fi

  # password
  if [ -n "$WERCKER_KUBECTL_PASSWORD" ]; then
    global_args="$global_args --password=\"$WERCKER_KUBECTL_PASSWORD\""
  fi

  # server
  if [ -n "$WERCKER_KUBECTL_SERVER" ]; then
    global_args="$global_args --server=\"$WERCKER_KUBECTL_SERVER\""
  fi

  # insecure-skip-tls-verify
  if [ -n "$WERCKER_KUBECTL_INSECURE_SKIP_TLS_VERIFY" ]; then
    global_args="$global_args --insecure-skip-tls-verify=\"$WERCKER_KUBECTL_INSECURE_SKIP_TLS_VERIFY\""
  fi
    # certificate-authority
  if [ -n "$WERCKER_KUBECTL_CERTIFICATE_AUTHORITY" ]; then
    global_args="$global_args --certificate-authority=\"$WERCKER_KUBECTL_CERTIFICATE_AUTHORITY\""
  fi
    # client-certificate
  if [ -n "$WERCKER_KUBECTL_CLIENT_CERTIFICATE" ]; then
    global_args="$global_args --client-certificate=\"$WERCKER_KUBECTL_CLIENT_CERTIFICATE\""
  fi
    # client-key
  if [ -n "$WERCKER_KUBECTL_CLIENT_KEY" ]; then
    global_args="$global_args --client-key=\"$WERCKER_KUBECTL_CLIENT_KEY\""
  fi
  
  # Command specific flags
  args=
  
  eval "$helm" "$global_args" "$cmd" "$args"
}

display_helm_version() {
  info "Running helm version:"
  "$helm" version --client
  echo ""
}

main;
