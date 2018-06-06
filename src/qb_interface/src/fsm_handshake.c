/*
 * fsm_handshake.c
 *
 *  Created on: Jun 6, 2018
 *      Author: francesco
 */




/*
 *
using namespace decision_making;

EventQueue* mainEventQueue;
struct MainEventQueue{
	MainEventQueue(){ mainEventQueue = new RosEventQueue();	}
	~MainEventQueue(){ delete mainEventQueue; }
};

FSM(handshake_FSM)
{
	FSM_STATES
	{
		start,
		handshake,
		ended
	}
	FSM_START(start);
	FSM_BGN
	{
		FSM_STATE(start)
				{
					FSM_TRANSITIONS
					{
						FSM_ON_EVENT("/PUSH", FSM_NEXT(handshake));
					}
				}
		FSM_STATE(handshake)
		{
			FSM_TRANSITIONS
			{
				FSM_ON_EVENT("/COIN", FSM_NEXT(ended));
			}
		}
		FSM_STATE(ended)
		{
			FSM_TRANSITIONS
			{
				FSM_ON_EVENT("/COIN", FSM_NEXT(start));
			}
		}
	}
	FSM_END
}

 *
 *
 *
		ros::AsyncSpinner spinner(2);
		spinner.start();

		ROS_INFO("Starting turnstile...");


		spinner.stop();
 * */
