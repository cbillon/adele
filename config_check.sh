
config_check () {
  error=0
  PROJECT="$1"
  # check validity .yml 
  yq "$PROJECTS_PATH_PROJECT"/"$PROJECT".yml >/dev/null  || exit 1
  
  PLUGINS=$(yq 'select(.plugins) |.plugins| keys' "$PROJECTS_PATH_PROJECT"/"$PROJECT".yml)
  [ "$DEBUG" = true ] && echo PLUGINS $PLUGINS
  for PLUGIN in $PLUGINS; do    
    [[ "$PLUGIN" =~ ^\-.* ]] && continue
    info "Check plugin: $PLUGIN"
    SOURCE=$(yq .plugins."$PLUGIN".source "$PROJECTS_PATH_PROJECT"/"$PROJECT".yml)  
    BRANCH_UPSTREAM=$(yq .plugins."$PLUGIN".branch "$PROJECTS_PATH_PROJECT"/"$PROJECT".yml)  
    PLUGIN_VERSION=$(yq .plugins."$PLUGIN".version "$PROJECTS_PATH_PROJECT"/"$PROJECT".yml)
    LOCALDEV=$(yq .plugins."$PLUGIN".localdev "$PROJECTS_PATH_PROJECT"/"$PROJECT".yml)
    #if LOCALDEV not defined set to null
    if [[ "$PLUGIN_VERSION" != null ]]; then    
      BRANCH_PLUGIN="$PLUGIN_VERSION"
      [ "$DEBUG" = true ] && echo "  BRANCH_PLUGIN: $BRANCH_PLUGIN  from PLUGIN_VERSION not null: $PLUGIN_VERSION"
    elif [[ "$LOCALDEV" != 'null' ]]; then
      BRANCH_PLUGIN="$LOCALDEV"
      [ "$DEBUG" = true ] && echo "  BRANCH_PLUGIN: $BRANCH_PLUGIN from LOCALDEV not null: $LOCALDEV"
    elif [[ "$BRANCH_UPSTREAM" != 'null' ]]; then
      BRANCH_PLUGIN="$BRANCH_UPSTREAM"
      [ "$DEBUG" = true ] && echo "  BRANCH_UPSTREAM: $BRANCH_PLUGIN from plugin's branch: $BRANCH_UPSTREAM"
    else
      error Manque definition version "$PLUGIN"
      error=1
    fi      
  done
  
  [ $error == 0 ] && success Configuration file "$PROJECT" successful || error Please correct configuration file and retry  

}