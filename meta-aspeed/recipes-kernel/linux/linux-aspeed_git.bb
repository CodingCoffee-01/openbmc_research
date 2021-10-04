#KBRANCH ?= "dev-5.10"
#LINUX_VERSION ?= "5.10.53"

#SRCREV="1519240139a91e3dbc97d8f79de29a22a3328257"


# Kernel dev 5.4
KBRANCH ?= "dev-5.4"
LINUX_VERSION ?= "5.4.48"

# skip version sanity, because the version moves with AUTOREV
KERNEL_VERSION_SANITY_SKIP = "1"

SRCREV="f77eed1af7f260c2444fd5d4e1ebb0d8c4aa366f"  
# 5.4.48

# 5.4.62
# SRCREV = "e6f142f15ae115e9077b7adb49399671c499561c"  

require linux-aspeed.inc
