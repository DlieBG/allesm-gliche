from pyfcm import FCMNotification
 
push_service = FCMNotification(api_key="AAAAOL_f7Vw:APA91bHx4r3FM3rH2RxU2JtjoMRMm8At-c9XGrUnxpp6BCHtQLup1uvjAzIifOBAMMqCDOi_Z0O6wgqYGMtVJdt4EUdVzBXiUmpP_kTJRWB_9TmJBTp2II3tELBvSBhQvxMZxxLYP_Xu")

registration_ids = [
    "dSvcsDop4ek:APA91bFcfxJak8NLbyxjpXavu3RLbf28jNLRRcAcTTN7_dzg-MS8rzN3uRsPvMgpmPNvpJCaRIFMOliUDX169uf3cH2V7isYYMa0F6Hn5VZRunVhz_ZJBUot5m9V2HotGtbBxtAULUvM"
                    ]
message_title = "Schwering Software"
message_body = "Neue Nachricht!"
result = push_service.notify_multiple_devices(registration_ids=registration_ids, message_title=message_title, message_body=message_body)