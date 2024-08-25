List[ [ 1672.530934929, 'me', "s.quit;" ], [ 1670.883572635, 'me', "p.pop;" ], [ 1668.426840526, 'me', "p.clear;" ], [ 1656.683532253, 'me', "~brn.clear(6);" ], [ 1650.034067869, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.0);
	sig = sig + (~saw.ar(2) * 0.0);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)" ], [ 1644.868345373, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.002!2), 120, 0.3)}" ], [ 1641.868395965, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.02);
	sig = sig + (~saw.ar(2) * 0.01);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)" ], [ 1637.32980932, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.03);
	sig = sig + (~saw.ar(2) * 0.015);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)" ], [ 1630.701562779, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.005!2), 120, 0.3)}" ], [ 1624.000416112, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.1);
	sig = sig + (~saw.ar(2) * 0.03);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)" ], [ 1620.020262892, 'me', "~fx.fadeTime_(10).play;" ], [ 1613.991927593, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.15);
	sig = sig + (~saw.ar(2) * 0.05);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)" ], [ 1608.521063612, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.01!2), 120, 0.3)}" ], [ 1598.249665907, 'me', "~saw.stop(15);" ], [ 1589.793831746, 'me', "(
~saw = {
	var sig, freq;
	freq = [42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([0.4,0.5], width:0.6).range(0.5,1), 0.7);
	sig = RLPF.ar(sig, 200, 0.2, 0.025);
}
)" ], [ 1583.443694751, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([0.4,0.5], width:0.6).range(0.5,1), 0.7);
	sig = RLPF.ar(sig, 200, 0.2, 0.025);
}
)" ], [ 1567.485210775, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 300, 0.3, 0.025);
}
)" ], [ 1561.928000009, 'me', "~pad.stop(15);" ], [ 1549.963942753, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 400, 0.3, 0.025);
}
)" ], [ 1545.594841484, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 500, 0.3, 0.025);
}
)" ], [ 1539.700306673, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.015!2), 180, 0.3)}" ], [ 1531.4588582, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [78,82,83,90].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.8, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.1;
}
)" ], [ 1524.969737661, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [78,82,83,90].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.8, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 1511.53443802, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,92].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.8, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 1505.387899423, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.02!2), 180, 0.2)}" ], [ 1500.932526022, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 500, 0.3, 0.05);
}
)" ], [ 1497.326024715, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 500, 0.3, 0.05);
}
)" ], [ 1491.17379495, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 500, 0.3, 0.05);
}
)" ], [ 1486.249109422, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 600, 0.3, 0.05);
}
)" ], [ 1476.327731527, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 600, 0.3, 0.05);
}
)" ], [ 1469.822139457, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 600, 0.1, 0.03);
}
)" ], [ 1465.357011769, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,92].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.08;
}
)" ], [ 1454.232660599, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,92].midicps, 0.003, 10);
	sig = tanh(sig * 3);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 1446.985104245, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.03!2), 180, 0.2)}" ], [ 1437.322419529, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 700, 0.1, 0.03);
}
)" ], [ 1426.070155007, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 800, 0.1, 0.03);
}
)" ], [ 1418.618906958, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1413.437427261, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,70,71].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1408.844664453, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,70,73].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1401.188534962, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,71,73].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1398.16042575, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,71,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1388.916866432, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,73,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1386.390094177, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.1);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)" ], [ 1382.142370396, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.1);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)" ], [ 1379.413019492, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,74,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1372.462426005, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1369.486490802, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.3).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1361.770270483, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([7,6], width:0.3).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)" ], [ 1356.484730527, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([7,6], width:0.3).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1600, 0.2, 0.02);
}
)" ], [ 1350.116547609, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([7,6], width:0.3).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 2000, 0.3, 0.02);
}
)" ], [ 1346.131349694, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([7,6], width:0.3).range(0.4,1), 0.6);
	sig = RLPF.ar(sig, 2000, 0.3, 0.02);
}
)" ], [ 1336.948486703, 'me', "~blip.clear(30);" ], [ 1325.118956162, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.2);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)" ], [ 1316.227602598, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.2);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 1308.569098658, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([10,9], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2000, 0.3, 0.02);
}
)" ], [ 1302.05319565, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([10,9], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2000, 0.3, 0.02);
}
)" ], [ 1294.305597991, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([10,9], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 3000, 0.3, 0.02);
}
)" ], [ 1287.224849304, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([14,16], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 3000, 0.3, 0.02);
}
)" ], [ 1286.313506195, 'me', "~saw.fadeTime_(4).play;" ], [ 1275.577133414, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 3);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 1268.461403479, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.025!2), 150, 0.2)}" ], [ 1256.939077643, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.02!2), 200, 0.3)}" ], [ 1244.277973964, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.2);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.3);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 1235.496308, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.15);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 1228.627618492, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.1);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 1224.89740882, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 7);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 1219.776252799, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([18,20], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 3000, 0.3, 0.02);
}
)" ], [ 1210.134203716, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.01!2), 150, 0.3)}" ], [ 1206.441656228, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.01!2), 100, 0.3)}" ], [ 1200.138857509, 'me', "~brn = {RLPF.ar(BrownNoise.ar(0.005!2), 100, 0.3)}" ], [ 1182.799412541, 'me', "~brn = {BrownNoise.ar(0.005!2)}" ], [ 1171.994232351, 'me', "~brn.fadeTime_(5).play;" ], [ 1162.314020633, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [30,30,66,78,80,85,94,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * LFNoise1.kr(0.2).exprange(0.5,10)) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)" ], [ 1155.544717245, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [30,30,66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * LFNoise1.kr(0.2).exprange(0.5,10)) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)" ], [ 1148.068919283, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 1138.676781002, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * LFNoise1.kr(0.2).exprange(0.5,10)) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)" ], [ 1131.516965678, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([12,15], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)" ], [ 1127.241375546, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([12,15], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)" ], [ 1119.887423991, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([12,11], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)" ], [ 1112.34442023, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([8,11], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)" ], [ 1105.0058729, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)" ], [ 1097.054591173, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 1093.936347338, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1500, 0.5, 0.03);
}
)" ], [ 1090.848460245, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1500, 0.5, 0.03);
}
)" ], [ 1085.027929183, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1500, 0.5, 0.03);
}
)" ], [ 1081.432915913, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1000, 0.5, 0.03);
}
)" ], [ 1074.462636572, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.15);
	sig = sig + (~saw.ar(2) * 0.1);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 1070.601600585, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = sig * LFPulse.ar(6).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 1062.612099021, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = sig * LFPulse.ar(6).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.04;
}
)" ], [ 1047.469568421, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = sig * LFPulse.ar(6).range(0.4, 1);
	sig = Splay.ar(sig) * 0.04;
}
)" ], [ 1032.964185214, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = Splay.ar(sig) * 0.04;
}
)" ], [ 1029.550698233, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 8);
	sig = Splay.ar(sig) * 0.04;
}
)" ], [ 1019.711706251, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * LFNoise1.kr(0.2).exprange(0.7,4)) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)" ], [ 1005.258990563, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * 2) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)" ], [ 991.690177311, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.1, 0.3));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * 2);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)" ], [ 989.528935102, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.1, 0.3));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * 2);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01;
}
)" ], [ 980.396760178, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.1, 0.3));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01;
}
)" ], [ 974.930383389, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.1, 0.3));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01;
}
)" ], [ 969.179874622, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.15);
	sig = sig + (~saw.ar(2) * 0.05);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 956.933118316, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1000, 0.5, 0.03);
}
)" ], [ 952.216360244, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,76].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1000, 0.5, 0.03);
}
)" ], [ 945.242448534, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1000, 0.5, 0.03);
}
)" ], [ 926.268393734, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 1500, 0.5, 0.03);
}
)" ], [ 922.033102632, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)" ], [ 916.14798097, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,82,83].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)" ], [ 909.527636157, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,83,87].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)" ], [ 903.740889649, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,87].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)" ], [ 897.236259772, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,88].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)" ], [ 888.046917837, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,90].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)" ], [ 883.40853675, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,90].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 879.400733454, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 871.656570547, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 865.952253473, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,76].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 859.977486022, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,80].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 853.373826899, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,80].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 849.118862181, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 845.323485773, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)" ], [ 838.759004811, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.02);
}
)" ], [ 833.525517424, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.02);
}
)" ], [ 829.536013665, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.02);
}
)" ], [ 821.76017327, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,66].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 1500, 0.3, 0.02);
}
)" ], [ 812.86379873, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 1500, 0.3, 0.02);
}
)" ], [ 809.928772194, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.3, 0.02);
}
)" ], [ 806.757727892, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)" ], [ 799.865576094, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(4, [0,0.5], 0.3).range(0.4,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)" ], [ 792.834905752, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(4, [0,0.5]).range(0.4,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)" ], [ 783.596169954, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(2, [0,0.5]).range(0.4,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)" ], [ 752.196933098, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)" ], [ 745.175585071, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 2000, 0.15, 0.01);
}
)" ], [ 741.099245201, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 2000, 0.15, 0.01);
}
)" ], [ 727.608789288, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.2, 0.8));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01;
}
)" ], [ 715.15263368, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(LFNoise1.kr(0.1).exprange(0.2, 0.8));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01!2;
}
)" ], [ 699.334944041, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01!2;
}
)" ], [ 696.084596065, 'me', "(
~saw = {
	var sig, freq;
	freq = [18,30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 1500, 0.15, 0.01);
}
)" ], [ 691.922924744, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 1500, 0.15, 0.01);
}
)" ], [ 679.538046364, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)" ], [ 672.272671885, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,82,83,85,94,94];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)" ], [ 662.48473144, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 1000, 0.15, 0.01);
}
)" ], [ 654.643772756, 'me', "(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 500, 0.15, 0.01);
}
)" ], [ 639.717312108, 'me', "(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 500, 0.15, 0.015);
}
)" ], [ 625.427332429, 'me', "(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = RLPF.ar(sig, 500, 0.15, 0.015);
}
)" ], [ 620.200381628, 'me', "(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = RLPF.ar(sig, 500, 0.15, 0.01);
}
)" ], [ 609.788613793, 'me', "(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = RLPF.ar(sig, 1000, 0.25, 0.01);
}
)" ], [ 604.364415249, 'me', "(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = RLPF.ar(sig, 1000, 0.25, 0.01);
	sig!2;
}
)" ], [ 556.94051308, 'me', "~saw.fadeTime_(8).play;" ], [ 543.627695066, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.15);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 535.250338151, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.2);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 520.648666423, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 8);
	sig = Splay.ar(sig) * 0.04;
}
)" ], [ 515.244232275, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 10);
	sig = Splay.ar(sig) * 0.03;
}
)" ], [ 509.394501141, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 10);
	sig = Splay.ar(sig) * 0.07;
}
)" ], [ 504.296934725, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 4);
	sig = Splay.ar(sig) * 0.12;
}
)" ], [ 500.03562178, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 4);
	sig = Splay.ar(sig) * 0.16;
}
)" ], [ 494.20236779, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = Splay.ar(sig) * 0.16;
}
)" ], [ 481.536607276, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = Splay.ar(sig) * 0.16;
}
)" ], [ 474.607680628, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.16;
}
)" ], [ 466.720109359, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.16;
}
)" ], [ 463.306955046, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.12;
}
)" ], [ 459.864226042, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,66,80,82,83,85,87].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.12;
}
)" ], [ 456.488320309, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,66,80,82,83,85,87].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.12;
}
)" ], [ 453.134728359, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 444.259104362, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,82,83,85];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)" ], [ 440.960991499, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.4);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 427.614494855, 'me', "(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.1).exprange(0.3, 0.45);
	sig = (~blip.ar(2) * 0.4);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 407.41337302, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.4);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 8), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 403.975430601, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 8), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 400.941065486, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 6), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 392.019463338, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 4), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 383.037285297, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 4), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 359.21873508, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 353.354870406, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.2);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 347.357952955, 'me', "~fx.fadeTime_(5).play;" ], [ 343.197330056, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.1);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)" ], [ 329.933057742, 'me', "(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.05);
	sig = GVerb.ar(sig.sum, 300, 5);
}
)" ], [ 293.763129673, 'me', "~fx.fadeTime_(8).play;" ], [ 277.978874615, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,82,83,85];
	trig = Impulse.kr(0.3);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)" ], [ 267.523681445, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78];
	trig = Impulse.kr(0.3);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)" ], [ 239.62542126, 'me', "(
~blip = {
	var sig, trig, notes;
	notes = [66,78];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(notes.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)" ], [ 216.192070645, 'me', "(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)" ], [ 212.419719027, 'me', "(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.03!2;
}
)" ], [ 208.322846227, 'me', "(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)" ], [ 204.580886949, 'me', "(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.1);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)" ], [ 196.575624817, 'me', "(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.1);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01!2;
}
)" ], [ 149.516320746, 'me', "~blip.fadeTime_(3).play;" ], [ 138.382610491, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,66,80,82,83,85].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.12;
}
)" ], [ 132.588997315, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.1;
}
)" ], [ 126.757635224, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.1;
}
)" ], [ 119.066417458, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78,80,82,83].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.08;
}
)" ], [ 112.311074385, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78,80,83].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.08;
}
)" ], [ 106.755963282, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78,80].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.08;
}
)" ], [ 100.047623864, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,78].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.08;
}
)" ], [ 93.116448846, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [56,66,76].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 89.183114123, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,76].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 83.58301297, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,78].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.05;
}
)" ], [ 74.879347008, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,78].midicps, 0.005, 10);
	sig = sig * 0.04
}
)" ], [ 67.275067657, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78].midicps, 0.005, 10);
	sig = sig * 0.03
}
)" ], [ 60.624557204, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,76].midicps, 0.005, 10);
	sig = sig * 0.03
}
)" ], [ 58.598542721, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,76].midicps, 0.005, 10);
	sig = sig * 0.02
}
)" ], [ 54.516604906, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78].midicps, 0.005, 10);
	sig = sig * 0.02
}
)" ], [ 43.06228449, 'me', "(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, 78.midicps, 0.005, 10);
	sig = sig * 0.02!2
}
)" ], [ 20.968185905, 'me', "~pad.fadeTime_(8).play;" ], [ 6.3229707310002, 'me', "p = ProxySpace.new(s.boot).push;" ], [ 0, 'me', "s.options.memSize_(2.pow(20));" ] ]