docker compose up -d
echo '- Waiting for databse to be ready...'
./scripts/wait-for-it.sh "postgresql://postgres:mysecretpassword@localhost:5433/postgres" -- echo '- Database is Ready'
npx prisma migrate dev --name init
npm run test
docker compose down