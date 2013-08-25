from jirwin/shell

# Install ZNC
run echo "deb http://archive.ubuntu.com/ubuntu quantal-backports main restricted universe multiverse" >> /etc/apt/sources.list
run echo "deb-src http://archive.ubuntu.com/ubuntu quantal-backports main restricted universe multiverse" >> /etc/apt/sources.list
run apt-get update

run apt-get install znc/quantal-backports znc-dbg/quantal-backports znc-dev/quantal-backports znc-extra/quantal-backports znc-perl/quantal-backports znc-python/quantal-backports znc-tcl/quantal-backports -y

# Create user
run useradd -d /home/jirwin -s /bin/bash -m jirwin

# Configure ZNC
add znc /home/jirwin/.znc
run chmod -R ag+rx /home/jirwin/.znc
run chmod ag-x /home/jirwin/.znc/znc.pem
run chown -R jirwin:jirwin /home/jirwin/.znc

# Start ZNC
cmd ["su", "jirwin", "-c", "znc -f"]

expose 6667
