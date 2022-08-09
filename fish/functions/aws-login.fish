function aws-login
  command aws-sso-util login
  _exportCreds
end

function _exportCreds
  set -l host (hostname)
  switch $host
    case 'Akhters-MacBook-Pro.local'
      set profiles personal
    case 'C02FD2Q7MD6R' # Upsatrt
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
        playgroundrosa \
        machinelearning \
        productionrosa \
        stanford \
        island \
        dedatalakestaging \
        dedatalakeprod \
        infosecprod \
        prodigyplayground \
        itinfrastructure \
        prodigytest \
        prodigystaging \
        prodigyproduction \
        destagingrosa \
        deproductionrosa \
        mlstagingrosa \
        mlproductionrosa \
        private
  end
  set -S profiles
  for i in $profiles
    command aws-export-credentials --profile $i --credentials-file-profile $i
  end
end
