draw_text(0,0,"CLIENT MODE, TARGET=" + string(global.mp_tgip) + ":" + string(global.mp_tgport));

latency_actual = abs(latency-30);
tickrate = global.realtime;
hop = round(latency/2)-round(latency_actual/2);
sv = round((1000/tickrate)/2);

draw_text(room_width-300, room_height-40, "ping: " + string(latency_actual) + "ms");
draw_text(room_width-200, room_height-40, "e2e: " + string(latency) + "ms");
draw_text(room_width-100, room_height-40, "hop: " + string(hop) + "ms");
draw_text(room_width-300, room_height-20, "tick: " + string(tickrate) + "/s");
draw_text(room_width-150, room_height-20, "sv: " + string(sv) + "ms");