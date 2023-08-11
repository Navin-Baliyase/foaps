class CsvImportJob
  include Sidekiq::Job

  def perform(file_path)
    MenuBookUploaderService.upload(file_path)
  end
end
