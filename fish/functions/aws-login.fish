function aws-login --argument-names roleType
        command aws-sso-util login
        _exportCreds $roleType
end

function _exportCreds --argument-names roleType
        set -l profiles (command aws configure list-profiles)
        if contains $roleType $profiles
                command aws-export-credentials --profile $roleType --credentials-file-profile $roleType
        end
        for i in $profiles
                if string match -q "*-$roleType" $i
                        echo "matching profile $i"
                        command aws-export-credentials --profile $i --credentials-file-profile $i
                end
        end
end
