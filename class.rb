class Daftar
	attr_reader :draft

	def initialize
		@draft = []
	end

	def buat_tugas(tugas)
		@draft << tugas
	end

	def tampilkan_file
		Dir.glob("*.txt").each { |file| puts file }
	end

	def simpan_ke_dalam_file(nama_file_nya)
		File.open(nama_file_nya, "a") do |s|
			draft.each { |task| s.puts task.normalize }
		end
	end

	def baca_dari_sebuah_file(file_nya)
		File.open(file_nya, "r") do |b|
			b.each_line { |baca| puts baca }
		end
	end
end


class Tugas
	attr_reader :index

	def initialize(daftar)
		@index = daftar
	end

	def normalize
		"# #{index}"
	end
end


d = Daftar.new
t = Tugas.new("deploy")
d.buat_tugas(t)
d.simpan_ke_dalam_file("oke.txt")
d.baca_dari_sebuah_file("oke.txt")
