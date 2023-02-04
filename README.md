## Wireguard VPN

### Supported platforms

- [x] Digital ocean
- [ ] AWS
- [ ] Yandex Cloud
- [ ] Selectel

### Prerequisites

* Docker on your local machine

### How to setup?

#### Digital ocean

1. Sign up in [Digital ocean](https://m.do.co/c/d461fa06b15a)
2. Go to [tokens](https://cloud.digitalocean.com/account/api/tokens) page and create new token
4. Run the following command

You can configure vpn with ENV varialbes:

|Name|Description|Default|
|---|---|---|
|TF_VAR_region| Region where vpn will be setup | ams3 |
|TF_VAR_wireguard_peers| How many configs you need. Comma-separated names | laptop |

```
docker run --rm \
  -e TF_VAR_do_token=your_token \
  -e TF_VAR_wireguard_peers=laptop,phone
  -v `pwd`:/opt/vpnius/config
  hetsketch/vpnius:latest
  ```

5. Install Wireguard client on your mobile/laptop
6. Import config to client
7. Enjoy

### TODO

- [x] Terraform template
- [x] Ansible playbook
- [ ] Dockerize script
- [ ] Imporove README
- [ ] AWS support
- [ ] Yandex support
- [ ] Selectel support
- [ ] OpenVPN support
