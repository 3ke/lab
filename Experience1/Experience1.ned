//
// Copyright (C) 2000 Institut fuer Telematik, Universitaet Karlsruhe
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//

package inet.examples.work.Experience1;

import inet.nodes.inet.Router;
import ned.DatarateChannel;
import inet.util.NetAnimTrace;
import inet.nodes.inet.StandardHost;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;


network Experience1
{
    parameters:
        double per = default(0);
        @display("bgb=549,525");
    types:
        channel C extends DatarateChannel
        {
            datarate = 2Mbps;
            delay = 10ms;
            per = per;
        }
        channel B extends DatarateChannel//Default
        {
            datarate = 1.7Mbps;
            delay = 20ms;
            per = per;
        }
        //Set QueSize=20
        channel B1ms extends DatarateChannel
        {
            datarate = 1.7Mbps;
            delay = 1ms;
            per = per;
        }
        channel B5ms extends DatarateChannel
        {
            datarate = 1.7Mbps;
            delay = 5ms;
            per = per;
        }
        channel B10ms extends DatarateChannel
        {
            datarate = 1.7Mbps;
            delay = 10ms;
            per = per;
        }
        channel B50ms extends DatarateChannel
        {
            datarate = 1.7Mbps;
            delay = 50ms;
            per = per;
        }
        channel B100ms extends DatarateChannel
        {
            datarate = 1.7Mbps;
            delay = 100ms;
            per = per;
        }
        channel B500kbps extends DatarateChannel
        {
            datarate = 0.5Mbps;
            delay = 20ms;
            per = per;
        }
        channel B1000kbps extends DatarateChannel
        {
            datarate = 1.0Mbps;
            delay = 20ms;
            per = per;
        }
        channel B1500kbps extends DatarateChannel
        {
            datarate = 1.5Mbps;
            delay = 20ms;
            per = per;
        }
        channel B2000kbps extends DatarateChannel
        {
            datarate = 2Mbps;
            delay = 20ms;
            per = per;
        }
        channel B3000kbps extends DatarateChannel
        {
            datarate = 3Mbps;
            delay = 20ms;
            per = per;
        }
    submodules:
        client1: StandardHost {
            parameters:
                @display("p=53,67;i=device/pc3");
        }
        client2: StandardHost {
            parameters:
                @display("p=53,340;i=device/pc3");
        }
        server: StandardHost {
            parameters:
                @display("p=493,223;i=device/pc2");
        }
        configurator: IPv4NetworkConfigurator {
            parameters:
                @display("p=53,421");
        }
        netAnimTrace: NetAnimTrace {
            @display("p=173,421");
        }

        router: Router {
            @display("p=283,223");
        }
    connections:
        client1.pppg++ <--> C <--> router.pppg++;
        client2.pppg++ <--> C <--> router.pppg++;
        router.pppg++  <--> B <--> server.pppg++;
}

