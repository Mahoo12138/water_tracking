abstract class IVesselRepository {
  Future<void> createVessel();
  Future<void> updateVessel();
  Future<void> deleteVessel();
  Future<void> getVessel();
  Future<void> getVessels();  
}

abstract class IReocrdRepository {
  Future<void> createRecord();
  Future<void> updateRecord();
  Future<void> deleteRecord();
  Future<void> getRecord();
  Future<void> getRecords();  
}

abstract class IReminderRepository {
  Future<void> createReminder();
  Future<void> updateReminder();
  Future<void> deleteReminder();
  Future<void> getReminder();
  Future<void> getReminders();  
}

abstract class ISettingRepository {
  Future<void> createSetting();
  Future<void> updateSetting();
  Future<void> deleteSetting();
  Future<void> getSetting();
  Future<void> getSettings();  
}