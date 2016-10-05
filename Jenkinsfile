
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
	 publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'caminho/do/relatorio/', reportFiles: 'index.html', reportName: 'Meu Relatorio'])
	 step([$class: 'ArtifactArchiver', artifacts: 'caminho/do/relatorio/'])
}
