## Wireguard VPN

### Supported platforms

- [x] Digital ocean
- [ ] Yandex Cloud
- [ ] Selectel

### Prerequisites

* Docker on your local machine

### How to setup?

#### Digital ocean

1. Sign up in [Digital ocean](https://m.do.co/c/d461fa06b15a)
2. Go to [tokens](https://cloud.digitalocean.com/account/api/tokens) page and create new tokens
3. Generate SSH key if don't have one
4. Run the command below

```
docker run --rm \
  -e REGION=Germany
  -e TOKEN=YOUR_DO_TOKEN
  k0va1/wireguard_vpn
```

5. Install Wireguard client on your mobile/laptop
6. Import config to client
7. Enjoy

### TODO

- [x] Terraform template
- [x] Ansible playbook
- [] Dockerize script
- [] Imporove README
