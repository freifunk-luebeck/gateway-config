Things for a working Gateway:

- [x] fastd
- [x] batman
- [x] DHCP
- [x] radvd (~~brachen wir vllt. gar nicht. Bird kann auch RAdv machen~~)
- [ ] BGP
- [x] prometheus
	- [ ] Bird exporter
	- [ ] Bind exporter
	- [x] Node exporter
- [ ] Rheinland uplink
- [ ] ICVPN peering


# Batman
Batman interfaces are created on-the-fly by batctl. ~~An additional .service or script is not needed.~~ We want to to be able
to only only `restart batman` without restarting fastd.

# RAdvd
~~It looks like BIRD is capable of sending RA's. I would rather pass on RAdvd to minimize the installation and configuration.~~ The debian package is not compiled with RAdv support :(
