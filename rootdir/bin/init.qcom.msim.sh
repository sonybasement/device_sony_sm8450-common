#!/vendor/bin/sh

MSIM_DEVICES=(
    xq-ct44 xq-ct54 xq-ct62 xq-ct72 # Dual-SIM version
)
MSIM_DEVICE=0

for device in "${MSIM_DEVICES[@]}"; do
    if grep -qi "Model: ${device}" /dev/block/bootdevice/by-name/LTALabel; then
        MSIM_DEVICE=1
        model=$device
        break
    fi
done

if [[ "${MSIM_DEVICE}" -eq 1 ]]; then
    setprop vendor.radio.multisim.config dsds
fi

if [[ $model == "xq-ct72" ]]; then
    setprop ro.vendor.product.rf.id PDX223-C2
else
    setprop ro.vendor.product.rf.id PDX223-A2
fi

