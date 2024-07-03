version: 0.0
os: linux
files:
  - source: /
    destination: /var/www/html
permissions:
  - object: /var/www/html
    pattern: "**"
    owner: ec2-user  # Replace with appropriate user
    group: apache  # Replace with appropriate group

hooks:
  BeforeInstall:
    - location: scripts/install.sh
      timeout: 300
      runas: root

  ApplicationStop:
    - location: scripts/stop_server.sh
      timeout: 300
      runas: root

  ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 300
      runas: root
