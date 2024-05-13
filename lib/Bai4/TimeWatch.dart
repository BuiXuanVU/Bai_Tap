import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimeWatch extends StatefulWidget {
  @override
  State<TimeWatch> createState() {
    return Timer();
  }
}

class Timer extends State<TimeWatch> {
  final StopWatchTimer timer = StopWatchTimer(mode: StopWatchMode.countDown);
  final TextEditingController input = TextEditingController();
  final _isHour = true;
  bool _isCountDown = false;
  bool _isComplete = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: const Text("Count down"),
              centerTitle: true,
              backgroundColor: Colors.cyan),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: input,
                decoration: const InputDecoration(hintText: "insert time"),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
                enabled: !_isCountDown,
                onChanged: (value) {
                  setState(() {
                    if (int.tryParse(value) != null) {
                      timer.setPresetTime(mSec: int.parse(value),add: false);
                      timer.onResetTimer();
                    }
                  });
                },
              ),
              StreamBuilder<int>(
                  stream: timer.rawTime,
                  initialData: timer.rawTime.value,
                  builder: (context, snapshot) {
                    final value = snapshot.data;
                    if (value == 0 && _isCountDown) {
                      SchedulerBinding.instance
                          .addPostFrameCallback((timeStamp) {
                        setState(() {
                          _isCountDown = false;
                          _isComplete = true;
                        });
                      });
                    }
                    final displayValue =
                        StopWatchTimer.getDisplayTime(value!, hours: _isHour);
                    return Text(
                      displayValue,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    );
                  }),
              const SizedBox(width: 80),
              ElevatedButton(
                  onPressed: () => TimeClick(),
                  child: Text(_isCountDown ? "stop" : "start"))
            ],
          ))),
    );
  }

  void TimeClick() {
    setState(() {
      _isCountDown = !_isCountDown;
    });
    if (_isCountDown) {
      if (_isComplete && int.tryParse(input.text) != null) {
        timer.setPresetTime(mSec: int.parse(input.text),add: false);
        timer.onResetTimer();
        _isComplete = false;
      }
      timer.onStartTimer();
    } else {
      timer.onStopTimer();
    }
  }
}
