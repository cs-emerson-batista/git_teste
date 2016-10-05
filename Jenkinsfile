
stage 'Checkout'
	node('master'){
	deleteDir()
	checkout scm
}
stage 'Build'
 node('master') {
 sh 'virtualenv venv; . venv/bin/activate; pip install -r requirements.txt --upgrade'
  step([$class: 'ArtifactArchiver', artifacts: 'build/'])
}
stage 'Run Tests'
  node('master') {
   sh 'virtualenv venv; . venv/bin/activate; python manage.py test'
	 sh 'mkdir . html '
	 publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'html/', reportFiles: 'index.html', reportName: 'HTML Report'])

}
