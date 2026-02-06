export default function Header() {
  return (
    <header className="bg-gradient-to-r from-blue-600 via-purple-600 to-pink-500 text-white py-4 shadow-lg">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <img src="/logo.svg" alt="KweekQR Logo" className="w-10 h-10" />
            <div>
              <h1 className="text-2xl font-bold tracking-tight">
                <span className="text-white">Kweek</span>
                <span className="text-orange-300">QR</span>
              </h1>
            </div>
          </div>

        </div>
      </div>
    </header>
  );
}
