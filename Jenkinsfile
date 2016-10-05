
stage 'Checkout'
	node('master'){
	deleteDir()
	checkout scm
}

stage 'Build'
 node('master') {
  sh './build.sh'
  step([$class: 'ArtifactArchiver', artifacts: '/workspace/venv/'])
 }

 stage 'Run Tests'
  node('master') {
   sh './teste.sh'
   publishHTML(target: [reportDir: 'build/reports/teste', reportFiles: 'index.html', reportName: 'Testes Instrumentados'])
   step([$class: 'JUnitResultArchiver', testResults: 'build/outputs/connected/*.xml'])
 }
