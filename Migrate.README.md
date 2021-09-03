# StorX Farmer Node Migration Tool
**Allow seamless moving of a a Farmer/Storage Node on StorX Network**

**Preliminaries**
- Already running and staked node: instructions found below if not already setup: 

```
  https://github.com/StorXNetwork/StorX-Node/blob/main/README.md 
  ```

- Mutilple VPS's, the source staked node and the destination node. 

**Warning:**

- Currently staked node will have it's reputation changed back to 1 (your SRX is still staked) upon reaching over 10 reputation the status of the node will change back to farmer, rewards will contiune.

- In talks with the devs (to allow new/updated IP Address to be allocated to a staked node, without rep resetting to 0).

-----

# How To Migrate StorX Farmer Node

**Fetch Migrate Script**

Bootstrap Command StorX Node Migration from Github:- 
```
    sudo su -c "bash <(wget -qO- https://raw.githubusercontent.com/kasiimh1/StorX-Node/main/migrate-tool.sh)" root 
```

Execute the script by running the command below:

```
bash StorX-Node-Migrate-Tool.sh
```

Will ask you to enter the following:

**VPS IP ADDRESS**: e.g. 192.168.0.1

**VPS SSH Password**: e.g. alpine

---------------------------------

## Features

- Automatically install all dependencies
- Fetch latest StorX Files for Docker
- Copy all existing Files from Source Node -> Destination Node (including all data files, config files and auto updates them to work on the new VPS)
- Starts Up the StorX Farmer Node on Destination VPS
- Shuts Down StorX Farmer Node on Source VPS
- *Keeps Files/Folders intact on Source VPS*


## How It Works

- Installs dependencies on new VPS
- zip exisiting StorX-Node folder
- scp copy from Source -> Destination VPS
- Fetch latest docker image
- start up node on Destination VPS and shutdown node on Source VPS

*Files remain on Source VPS*

## Troubleshooting

Public discussions on the technical issues, post articles and request for Enhancements and Technical Contributions. 

- [My GitHub](https://github.com/kasiimh1) - Make an issue or submit a Pull Request.

- [Telegram](https://t.me/StorXNetwork) - Stay updated with all the Announcements.
- [Discord](https://discord.gg/ha4Jufj2Nm) - Join the community to find answers to all your questions.
- [Reddit](https://www.reddit.com/r/StorXNetwork) - Join the channel to have a healthy interaction with the community.
- [GitHub](https://github.com/StorXNetwork) - Join the developers community on GitHub
