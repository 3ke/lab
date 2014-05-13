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

package inet.examples.work.Experience2;

import inet.nodes.inet.Router;
import ned.DatarateChannel;
import inet.util.NetAnimTrace;
import inet.nodes.inet.StandardHost;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;


network Experience2
{
    parameters:
        double per = default(0);
        @display("bgb=549,525");
    types:
        channel C10Mb10ms extends DatarateChannel
        {
            datarate = 10Mbps;
            delay = 10ms;
            per = 0;
        }
        channel C1Mb10ms extends DatarateChannel
        {
            datarate = 1Mbps;
            delay = 10ms;
            per = 0;
        }
        channel B500kb20ms extends DatarateChannel
        {
            datarate = 500kbps;
            delay =20ms;
            per=per;
        }
    submodules:
        client: StandardHost {
            parameters:
                @display("p=39,227;i=device/pc3");
        }
        server: StandardHost {
            parameters:
                @display("p=506,227;i=device/pc2");
        }
        configurator: IPv4NetworkConfigurator {
            parameters:
                @display("p=53,421");
        }
        netAnimTrace: NetAnimTrace {
            @display("p=173,421");
        }

        router1: Router {
            @display("p=181,227");
        }
        router2: Router {
            @display("p=342,227");
        }
    connections:
        client.pppg++  <--> C10Mb10ms  <--> router1.pppg++;
        router1.pppg++ <--> B500kb20ms <--> router2.pppg++;
        router2.pppg++ <--> C1Mb10ms   <--> server.pppg++;
}

