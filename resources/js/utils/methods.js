import { format } from "date-fns";
import { id } from "date-fns/locale";

const formatRupiah = (value) => {
    return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(value).split(',')[0];
}

const cheking = (data) => {
     // Fungsi untuk mengecek apakah suatu nilai kosong
     const isThereEmpty = (value) => {
        if (value === 0) return false; // Biaya 0 tetap dianggap valid
        if (value === null || value === undefined) return true; // Cek null atau undefined
        if (Array.isArray(value) && value.length === 0) return true; // Cek array kosong
        if (typeof value === "object" && Object.keys(value).length === 0)
            return true; // Cek object kosong
        return false;
    };

    // Mengecek apakah ada data yang kosong
    const isComplete = !Object.values(data).some(isThereEmpty);
    return isComplete
}


const defaultFieldUserId = [
    {
        label: "User Id",
        placeholder: "Masukkan Id User",
        type_status: "input",
        name: "User",
    },
];


const formatDate = (dateString) => {
    return format(new Date(dateString), "dd MMMM yyyy HH:mm:ss", {
        locale: id,
    });
};

const dateFormat = (dateString) => {
    return format(new Date(dateString), "MMMM d, yyyy", {
        locale: id,
    });
};


function maskInvoice(invoice) {
    if (!invoice) return '';
    const last3 = invoice.slice(-3);
    const firstThree = invoice.slice(0,3);
    return `${firstThree}xxxxxxxxxxxx${last3}`;
}

// 2. Masking nomor HP (081336920647 → *********647)
function maskPhone(phone) {
    if (!phone) return '';
    const last3 = phone.slice(-3);
    const first = phone.slice(0,3);
    return '*********' + last3;
}

// 3. Masking harga (Rp 3.023 → IDR 31xxxx)
function maskPrice(price) {
    if (!price) return '';
    
    // hapus simbol dan titik dulu
    const numeric = price.replace(/[^\d]/g, '');
    
    if (numeric.length <= 2) return 'Rp **';
    
    const first2 = numeric.slice(0, 2);
    return `Rp ${first2}${'x'.repeat(numeric.length - 2)}`;
}

export { formatRupiah,cheking,defaultFieldUserId,formatDate,dateFormat,maskPrice,maskPhone,maskInvoice }