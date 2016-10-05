
stage 'Checkout'
	node('master'){
	deleteDir()
	checkout scm
}
stage 'Build'
	node('master'){

 	sh 'virtualenv venv; . venv/bin/activate; pip install -r requirements.txt --upgrade'
  step([$class: 'ArtifactArchiver', artifacts: 'build/'])
}
stage 'Run Tests'
	node('master'){
   sh 'virtualenv venv; . venv/bin/activate; python manage.py test'
	 sh 'mkdir html'
	 publishHTML(target: [reportDir: 'html/', reportFiles: 'index.html', reportName: 'Testes Instrumentados'])
	 step([$class: 'JUnitResultArchiver', testResults: 'build/*.xml'])
}
