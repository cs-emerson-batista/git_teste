
stage 'Checkout'
	node('master'){
	deleteDir()
	checkout scm
}
stage 'Build'
 node('master') {
 sh 'virtualenv venv; . venv/bin/activate; pip install -r requirements.txt --upgrade'
  step([$class: 'ArtifactArchiver', artifacts: '/workspace/venv/'])
}
stage 'Run Tests'
  node('master') {
   sh 'python manage.py test'
   publishHTML(target: [reportDir: 'build/reports/teste', reportFiles: 'index.html', reportName: 'Testes Instrumentados'])
   step([$class: 'JUnitResultArchiver', testResults: 'build/outputs/connected/*.xml'])
}
