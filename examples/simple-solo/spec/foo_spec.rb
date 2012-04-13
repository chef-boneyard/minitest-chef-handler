describe_recipe 'foo' do
  it 'creates the temporal file' do
    File.exist?('/tmp/temporal_file').must_equal true
  end

  it "succeed" do
    run_status.success?.must_equal true
  end
end
