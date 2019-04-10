# dynamic-dns-he

Create a cron job to update dynamic DNS every 5 minutes on Hurrican Electric servers

## Setup

1. Clone the repository
  ```bash
  $ git clone https://github.com/tsrivishnu/dynamic-dns-he.git
  $ cd dynamic-dns-he
  ```

2. Make the config file from example.

  ```bash
  $ cp config.example config
  ```

3. Update the config to match yours.
4. Test by running the script and check your domain if the IP is updated.

  ```bash
  $ ./update-dns-ip.sh
  ```

5. Install the cron job to run every 5 minutes.

  ```bash
  make install
  ```
