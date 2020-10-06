import os, time


logs = '/var/log/cron'
backup = '/backup'
cifs = '/tmp/lan'
now = time.time()
days = 7

# Удаление файлов старше 7 суток
def del_old_files(path):
   os.chdir(path)
   for root, dirs, files in os.walk('.', topdown = False):
      for name in files:
         file_name = os.path.join(root, name)
         mtime = os.path.getmtime(file_name)
         if now - mtime > (days * 86400):
            os.remove(file_name)
            print('Удалил', file_name)

# Удаление пустых папок
def del_empty_dirs(path):
   for dirs in os.listdir(path):
      a = os.path.join(path, dirs)
      if os.path.isdir(a):
         del_empty_dirs(a)
         if not os.listdir(a):
            os.rmdir(a)
            print(a, 'удалена')

def del_old_file_cifs(path):
   CIFS_PATH = os.getenv('cifs_share')
   CIFS_USER = os.getenv('login')
   CIFS_PASS = os.getenv('password')

   os.system('mkdir /tmp/lan')
   os.system('mount -t cifs %s /tmp/lan -o user=%s,password=%s' % (CIFS_PATH, CIFS_USER, CIFS_PASS))
   os.chdir(path)
   for root, dirs, files in os.walk('.', topdown = False):
      for name in files:
         file_name = os.path.join(root, name)
         mtime = os.path.getmtime(file_name)
         if now - mtime > (days * 86400):
            os.remove(file_name)
            print('Удалил', file_name)
   os.system('umount /tmp/lan')

# Осистка  логов
del_old_files(logs)
del_empty_dirs(logs)

# Очиста бекапов
del_old_files(backup)
del_empty_dirs(backup)

# Очиста cifs
del_old_file_cifs(cifs)
