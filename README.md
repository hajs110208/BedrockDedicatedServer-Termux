# BedrockDedicatedServer-Termux

## What is this?
You cannot run Bedrock Dedicated Server in ARM devices, especially Android devices that use Bionic libc. Other scripts usually use box64 in proot-distro for this. But it has very high performance overhead.

So, I made a easy-to-use scripts that makes you run Bedrock Dedicated Server with **neither chroot nor proot-distro!**
This uses glibc-runner and box64-glibc, so
**NO PERFORMANCE LOSS FROM PROOT!**

This script is on active development, so please report it to github issues if there's any issue.

## How to use?

Simply copy & paste the command below.

```bash
bash <(curl -sL https://raw.githubusercontent.com/hajs110208/BedrockDedicatedServer-Termux/refs/heads/main/install_main.sh)
```

## Status

| Priority | Name            | Done? | Working correctly? |
|----------|-----------------|-------|--------------------|
| 1        | Version selection | ✅️     | ✅️                  |
| 2        | Start script    | ✅️     |  ✅️                 |
| 3        | Updater | ❌️     |  -     |
| 4        | Backup & Restore | ❌️    | - |
