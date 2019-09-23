
node {
    stage 'Clone repository'
    checkout([
        $class: 'GitSCM',
        branches: [
            [name: '*/master']
        ],
        doGenerateSubmoduleConfigurations: false,
        extensions: [],
        submoduleCfg: [],
        userRemoteConfigs: [
            [url: 'https://github.com/nikolayantonov/jenkins2-course-spring-boot']
        ]
    ])

    stage 'Build & package'
    def img = docker.build('demo-jenkins-ecr')

    stage 'Docker push'
    docker.withRegistry('https://473293451041.dkr.ecr.eu-central-1.amazonaws.com', 'ecr:eu-central-1:demo-jenkins-ecr') {
      docker.image('demo-jenkins-ecr').push('latest')
    }
}
