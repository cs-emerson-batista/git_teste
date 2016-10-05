
stage 'Checkout'
	node('master'){
	deleteDir()
	checkout scm
}
stage 'Build'
 node('master') {
 sh 'virtualenv venv; . venv/bin/activate; pip install -r requirements.txt --upgrade'
  step([$class: 'ArtifactArchiver', artifacts: 'venv/'])
}
stage 'Run Tests'
  node('master') {
   sh 'virtualenv venv; . venv/bin/activate; python manage.py test'
	 step([$class: 'ArtifactArchiver', artifacts: 'venv/'])
}
