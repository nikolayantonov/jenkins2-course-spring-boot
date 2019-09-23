node {
    stage ‘Clone repository’
    checkout([
        $class: 'GitSCM',
        branches: [
            [name: '*/master']
        ],
        doGenerateSubmoduleConfigurations: false,
        extensions: [],
        submoduleCfg: [],
        userRemoteConfigs: [
            [url: 'https://github.com/De117/jenkins2-course-spring-boot']
        ]
    ])

    stage ‘Build & package’
    def img = docker.build('atmosphere-jenkins')

    stage 'Docker push'
    docker.withRegistry('https://473293451041.dkr.ecr.eu-central-1.amazonaws.com', 'ecr:eu-west-1:jenkins-ecr-test') {
    docker.image('atmosphere-jenkins').push('latest')
}
