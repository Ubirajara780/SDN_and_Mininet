#!/usr/bin/python

from mininet.net import Mininet
from mininet.node import RemoteController, Host, OVSKernelSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel, info
from mininet.link import OVSLink

def myNetwork():

    net = Mininet(topo=None,
                  build=False,
                  link=OVSLink,
                  ipBase='10.0.0.0/8')

    info('*** Adding controller\n')
    c0 = net.addController(name='c0',
                           controller=RemoteController,
                           ip='172.17.0.2',  # IP do container ONOS
                           protocol='tcp',
                           port=6633)

    info('*** Add switches\n')
    s0 = net.addSwitch('s0', cls=OVSKernelSwitch, protocols=["OpenFlow10"])
    s1 = net.addSwitch('s1', cls=OVSKernelSwitch, protocols=["OpenFlow10"])
    s2 = net.addSwitch('s2', cls=OVSKernelSwitch, protocols=["OpenFlow10"])
    s3 = net.addSwitch('s3', cls=OVSKernelSwitch, protocols=["OpenFlow10"])
    s4 = net.addSwitch('s4', cls=OVSKernelSwitch, protocols=["OpenFlow10"])
    s5 = net.addSwitch('s5', cls=OVSKernelSwitch, protocols=["OpenFlow10"])
    s6 = net.addSwitch('s6', cls=OVSKernelSwitch, protocols=["OpenFlow10"])

    info('*** Add hosts\n')
    h1 = net.addHost('h1', cls=Host, ip='10.0.0.1')
    h2 = net.addHost('h2', cls=Host, ip='10.0.0.2')
    h3 = net.addHost('h3', cls=Host, ip='10.0.0.3')
    h4 = net.addHost('h4', cls=Host, ip='10.0.0.4')
    h5 = net.addHost('h5', cls=Host, ip='10.0.0.5')
    h6 = net.addHost('h6', cls=Host, ip='10.0.0.6')
    h7 = net.addHost('h7', cls=Host, ip='10.0.0.7')
    h8 = net.addHost('h8', cls=Host, ip='10.0.0.8')

    info('*** Add links\n')
    # Conectando switch raiz aos de segundo nível
    net.addLink(s0, s1)
    net.addLink(s0, s2)

    # Conectando switches de segundo nível aos de terceiro nível
    net.addLink(s1, s3)
    net.addLink(s1, s4)
    net.addLink(s2, s5)
    net.addLink(s2, s6)

    # Conectando hosts aos switches de terceiro nível
    net.addLink(h1, s3)
    net.addLink(h2, s3)
    net.addLink(h3, s4)
    net.addLink(h4, s4)
    net.addLink(h5, s5)
    net.addLink(h6, s5)
    net.addLink(h7, s6)
    net.addLink(h8, s6)

    info('*** Starting network\n')
    net.build()

    info('*** Starting controllers\n')
    for controller in net.controllers:
        controller.start()

    info('*** Starting switches\n')
    for sw in [s0, s1, s2, s3, s4, s5, s6]:
        net.get(sw.name).start([c0])

    info('*** Post configure switches and hosts\n')
    CLI(net)
    net.stop()

if __name__ == '__main__':
    setLogLevel('info')
    myNetwork()
