
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
   sh 'virtualenv venv; . venv/bin/activate; python manage.py test > resultado.txt'
   publishHTML(target: [reportDir: '. build/reports/teste', reportFiles: 'index.html', reportName: 'Testes Instrumentados'])

}
