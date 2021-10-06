FILESEXTRAPATHS_prepend_romulus := "${THISDIR}/${PN}:"

EXTRA_OEMESON_append_romulus = " -Dnegative-errno-on-fail=true"

CHIPS = " \        
        bus@1e78a000/i2c-bus@200/max31785@52_air \
        bus@1e78a000/i2c-bus@200/max31785@52_water \
        bus@1e78a000/i2c-bus@200/power-supply@68 \
        bus@1e78a000/i2c-bus@200/power-supply@69 \
        bus@1e78a000/i2c-bus@200/bmp280@77 \
        bus@1e78a000/i2c-bus@200/dps310@76 \
	bus@1e78a000/i2c-bus@280/tmp423a@4c \
        bus@1e78a000/i2c-bus@280/ir35221@70 \
        bus@1e78a000/i2c-bus@280/ir35221@71 \
        bus@1e78a000/i2c-bus@300/tmp423a@4c \
        bus@1e78a000/i2c-bus@300/ir35221@70 \
        bus@1e78a000/i2c-bus@300/ir35221@71 \
        bus@1e78a000/i2c-bus@500/tmp275@4a \
        "

CHIPS_romulus2600 = " \
		      bus@1e78a000/i2c-bus@680/tmp275@42\
	              bus@1e78a000/i2c-bus@680/tmp275@46\
		      pwm-tacho-controller@1e610000\
                    "

CHIPS_romulus     = " \
		      bus@1e78a000/i2c-bus@440/tmp275@42\
                      bus@1e78a000/i2c-bus@440/tmp275@46\
                      pwm-tacho-controller@1e786000 \
                    "


ITEMSFMT = "ahb/apb/{0}.conf"

ITEMS = "${@compose_list(d, 'ITEMSFMT', 'CHIPS')}"

ITEMS += "iio-hwmon-battery.conf"

ITEMS += " iio-hwmon-12v.conf"
ITEMS += " iio-hwmon-5v.conf"
ITEMS += " iio-hwmon-3v.conf"

OCCS = " \
       00--00--00--06/sbefifo1-dev0/occ-hwmon.1 \
       00--00--00--0a/fsi1/slave@01--00/01--01--00--06/sbefifo2-dev0/occ-hwmon.2 \
       "

OCCSFMT = "devices/platform/gpio-fsi/fsi0/slave@00--00/{0}.conf"
OCCITEMS = "${@compose_list(d, 'OCCSFMT', 'OCCS')}"

ENVS = "obmc/hwmon/{0}"
SYSTEMD_ENVIRONMENT_FILE_${PN}_append_romulus = " ${@compose_list(d, 'ENVS', 'ITEMS')}"
SYSTEMD_ENVIRONMENT_FILE_${PN}_append_romulus = " ${@compose_list(d, 'ENVS', 'OCCITEMS')}"
