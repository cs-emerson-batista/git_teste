node('master'){
stage 'Checkout'
	deleteDir()
	checkout scm
stage 'Build'
 	sh 'virtualenv venv; . venv/bin/activate; pip install -r requirements.txt --upgrade'
	sh 'tar -czf build.tar.gz *'
	archiveArtifacts allowEmptyArchive: true, artifacts: 'build.tar.gz', excludes: null, onlyIfSuccessful: true
stage 'Run Tests'
		 sh 'virtualenv venv; . venv/bin/activate; python manage.py test >> resultado.txt'// do something that fails
stage 'Escrevendo'
		 writeFile encoding: 'UTF-8', file: 'resultado.txt', text: '${currentBuild.result}'
}
