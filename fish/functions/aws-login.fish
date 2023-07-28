function aws-login
  command aws-sso-util login
  _exportCreds
end

function _exportCreds
  set -l host (hostname)
  switch $host
    case 'Akhters-MacBook-Pro.local'
      set profiles personal
    case 'LV1XJ97QFQ' # Upsatrt
      set profiles stagingrosa \
        prodigy \
        fairlendingaudit \
        itsandbox \
        log \
        infosec \
        audit \
        cicd \
        production \
        sandbox \
        devops \
        devopsrosa \
        payer \
        networks \
        playground \
        playground-eng-admin \
        playgroundrosa \
        machinelearning \
        productionrosa \
        stanford \
        island \
        dedatalakestaging \
        dedatalakeprod \
        infosecprod \
        infosecstaging \
        prodigyplayground \
        itinfrastructure \
        prodigytest \
        prodigystaging \
        prodigyproduction \
        destagingrosa \
        deproductionrosa \
        mestaging \
        mlstagingrosa \
        mlproductionrosa \
        private \
        ephemeralrosa \
        ephemeral \
        delivery \
        autoretailproduction \
        mlproduction \
        autoretaildemo
  end
  set -S profiles
  for i in $profiles
    command aws-export-credentials --profile $i --credentials-file-profile $i
  end
end
