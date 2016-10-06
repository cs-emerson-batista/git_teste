node('master'){
stage 'Checkout'
	deleteDir()
	checkout scm
stage 'Build'
 	sh 'virtualenv venv; . venv/bin/activate; pip install -r requirements.txt --upgrade'
stage 'Run Tests'
	 sh 'virtualenv venv; . venv/bin/activate; python manage.py test'// do something that fails
stage 'Notificando'
	def causes = currentBuild.rawBuild.getCauses()
	echo causes
}
