function aws-login
  command aws-sso-util login
  _exportCreds
end

function _exportCreds
  set -l profiles (command aws configure list-profiles)
  for i in $profiles
    command aws-export-credentials --profile $i --credentials-file-profile $i
  end
end
